package mysql

import (
	"github.com/bearname/videohost/internal/common/db"
	"github.com/bearname/videohost/internal/user/domain/model"
)

type UserRepository struct {
	connector db.Connector
}

func NewMysqlUserRepository(connector db.Connector) *UserRepository {
	m := new(UserRepository)
	m.connector = connector
	return m
}

func (r *UserRepository) CreateUser(key string, username string, password []byte, email string, isSubscribed bool, role model.Role, accessToken string, refreshToken string) error {
	sqlQuery := "INSERT INTO users (key_user, username, password, email, isSubscribed,  role, access_token, refresh_token) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
	query, err := r.connector.GetDb().Query(sqlQuery, key, username, password, email, isSubscribed, role, accessToken, refreshToken)
	if err != nil {
		return err
	}

	defer query.Close()

	return nil
}

func (r *UserRepository) FindById(userId string) (model.User, error) {
	var user model.User

	row := r.connector.GetDb().QueryRow("SELECT key_user, username, password, email, isSubscribed, created, role, secret, access_token, refresh_token FROM users WHERE key_user = ?;", userId)

	err := row.Scan(
		&user.Key,
		&user.Username,
		&user.Password,
		&user.Email,
		&user.IsSubscribed,
		&user.Created,
		&user.Role,
		&user.Secret,
		&user.AccessToken,
		&user.RefreshToken,
	)

	return user, err
}

func (r *UserRepository) FindByUserName(username string) (model.User, error) {
	var user model.User

	row := r.connector.GetDb().QueryRow("SELECT key_user, username, password, email, isSubscribed, created, role, secret, access_token, refresh_token FROM users WHERE username = ?;", username)

	err := row.Scan(
		&user.Key,
		&user.Username,
		&user.Password,
		&user.Email,
		&user.IsSubscribed,
		&user.Created,
		&user.Role,
		&user.Secret,
		&user.AccessToken,
		&user.RefreshToken,
	)

	return user, err
}

func (r *UserRepository) UpdatePassword(username string, password []byte) bool {
	query := "UPDATE users SET password = ? WHERE username = ?;"
	err := r.connector.ExecTransaction(query, password, username)

	return err == nil
}

func (r *UserRepository) UpdateAccessToken(username string, token string) bool {
	query := "UPDATE users SET access_token = ?  WHERE username = ?;"
	err := r.connector.ExecTransaction(query, token, username)

	return err == nil
}

func (r *UserRepository) UpdateRefreshToken(username string, token string) bool {
	query := "UPDATE users SET refresh_token = ?  WHERE username = ?;"
	err := r.connector.ExecTransaction(query, token, username)

	return err == nil
}

func (r *UserRepository) GetCountVideos(userId string) (int, bool) {
	rows, err := r.connector.GetDb().Query("SELECT COUNT(owner_id) AS countReadyVideo FROM video WHERE owner_id=?;", userId)
	if err != nil {
		return 0, false
	}

	defer rows.Close()

	var countVideo int
	for rows.Next() {
		err := rows.Scan(
			&countVideo,
		)
		if err != nil {
			return 0, false
		}
	}

	return countVideo, true
}
